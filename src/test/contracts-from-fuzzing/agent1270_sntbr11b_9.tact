struct Level3 {
  deep: Int;
}

struct Level2 {
  l3: Level3;
  flag: Bool;
}

struct Level1 {
  l2: Level2;
  value: Int;
}

contract DeepNest {
  data: Level1 = Level1{
    l2: Level2{
      l3: Level3{ deep: 777 },
      flag: true
    },
    value: 10
  };
  
}