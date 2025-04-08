struct ABool {
    val: Bool;
}

contract ManyBools {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
    e: Bool;
    s: ABool;

    init() {
        self.a=true; self.b=false; self.c=true; self.d=false; self.e=true;
        self.s=ABool{val:true};
    }

    receive() {
        let _=self.a;
        let _=self.s;
    }
}