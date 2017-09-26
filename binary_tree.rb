class Node  
  attr_accessor :value, :parent, :left, :right 
  def initialize(value=nil)
    @value = value
    @parent = parent 
    @left = left 
    @right = right 
  end 
end 

class BinaryTree
  attr_accessor :root 
  def initialize
    @root = Node.new 
  end 

  def elements(array)
    @root.value = array.shift if @root.value == nil
    array.each do |element| 
      build_tree(element,@root)
    end 
  end 

  def build_tree(element,node)
    if element <= node.value 
      if node.left == nil
        next_node = Node.new(element) 
        node.left = next_node
        next_node.parent = node
      else
        node = node.left 
        build_tree(element,node)
      end 
    else 
      if node.right == nil 
        next_node = Node.new(element)
        node.right = next_node
        next_node.parent = node
      else 
        node = node.right 
        build_tree(element,node)
      end 
    end 
  end 

  def bfs(answer)
    queue = Queue.new
    queue << @root 
    until queue.empty?
      node = queue.shift
        if node.value == answer 
        return node.value 
        else 
          queue << node.left if node.left != nil 
          queue << node.right if node.right != nil 
        end 
    end 
    return nil
  end 

  def dfs(answer)
    stack = []
    stack << @root 
    until stack.empty?
      node = stack.pop
      if node.value == answer 
        return node.value 
      else 
        stack << node.left if node.left != nil 
        stack << node.right if node.right != nil 
      end 
    end 
    return nil
  end 

   def dfs_rec(answer, node=@root)
     return nil if node.nil?
     return node.value if node.value == answer
     dfs_rec(answer,node.left) unless node.left.nil?
     dfs_rec(answer,node.right) unless node.right.nil?
   end 

end
new = BinaryTree.new
new.elements([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
new.bfs(9)
new.dfs(9)
new.dfs_rec(67)
_
 

