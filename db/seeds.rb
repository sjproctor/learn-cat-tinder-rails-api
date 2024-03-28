cats = [
  {
    name: 'Kevin',
    age: 8,
    enjoys: 'his Mickey Mouse stuffie',
    image: 'https://images.unsplash.com/photo-1495360010541-f48722b34f7d?q=80&w=3374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
  },
  {
    name: 'Toast',
    age: 4,
    enjoys: 'touching your face while you sleep',
    image: 'https://images.unsplash.com/photo-1573865526739-10659fec78a5?q=80&w=3415&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
  },
    {
    name: 'Raisins',
    age: 6,
    enjoys: 'perching on the refrigerator',
    image: 'https://images.unsplash.com/photo-1526336024174-e58f5cdd8e13?q=80&w=3387&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
  }
]

# loop through the array and create each cat attribute
cats.each do |cat|
  Cat.create(cat)
  puts "Creating cat: #{cat}"
end