struct Mix {
    i: Int;
    b: Bool;
    s: String;
    innerOpt: Inner?;
}

struct Inner { val: Int; flag: Bool; }

contract Composite {
    mix: Mix = Mix{
        i: 100,
        b: true,
        s: "hello",
        innerOpt: Inner{ val: -5, flag: false }
    };
}
