struct AA {
  a: Int;
}

struct BB {
  b: Int;
}

struct CC {
  aa: AA;
  bb: BB;
}

contract Test {
  x: CC = CC{
    aa: AA{ a: 1 },
    bb: BB{ b: 2 }
  };
}