struct SInner {
    a: Int;
    b: Bool;
}

struct SOuter {
    s: SInner;
    c: Int;
}

struct Stop {
   out: SOuter;
   msg: String;
}

contract ContractWithStruct {
    s: Stop = Stop{
      out: SOuter{ s: SInner{a:1,b:true}, c:42 },
      msg: "Hello"
    };
    init() {}
}