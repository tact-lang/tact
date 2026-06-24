struct Top {
  a: Int;
  b: Bottom;
}

struct Bottom {
    x: Int;
    y: Int;
}

contract InlineInit {
    f: Top = Top{a:1, b:Bottom{x:2,y:3}};
}