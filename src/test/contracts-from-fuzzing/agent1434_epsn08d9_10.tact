struct Inner {
    x: Int;
}

struct Middle {
    optionalInner: Inner?;
    intVal: Int;
    boolVal: Bool;
    stringVal: String;
}

contract Test {
    s: Middle = Middle{
        optionalInner: null,
        intVal: 5,
        boolVal: true,
        stringVal: "str"
    };

    receive() {}
}