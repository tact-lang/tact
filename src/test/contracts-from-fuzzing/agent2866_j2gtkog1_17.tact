struct First {
    x: Int;
    y: Bool;
}

struct Second {
    s: First;
    label: String;
}

contract Mixed {
    a: First;
    b: Second;

    init() {
        self.a = First{x:1, y:true};
        self.b = Second{s: First{x:2,y:false}, label: "hi"};
    }

    receive() {}
}