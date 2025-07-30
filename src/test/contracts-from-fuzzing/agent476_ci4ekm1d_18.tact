struct Level1 {
  l2: Level2;
}
struct Level2 {
  l3: Level3;
}
struct Level3 {
  l4: Level4;
}
struct Level4 {
  l5: Level5;
}
struct Level5 {
  done: Int;
}

contract SuperDeep {
  val: Level1;
  
  init() {
    self.val = Level1{l2: Level2{l3: Level3{l4: Level4{l5: Level5{done: 7}}}}};
  }
  
  receive() {
    let result = self.val.l2.l3.l4.l5.done;
  }
}