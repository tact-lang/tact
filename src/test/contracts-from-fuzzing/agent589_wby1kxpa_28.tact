struct Boo {
  x: Int;
}

message(100) Bar {}

contract MsgStructs {
    b: Boo;
    m: Bar;

    init() {
        self.b = Boo{x: 1};
        self.m = Bar{};
    }
}