message BigNested {
  level1: Level1;
}

message Level1 {
  level2: Level2;
}

message Level2 {
  value: Int;
}

contract Test {
  receive(msg: BigNested) {
    let v = msg.level1.level2.value;
  }
}