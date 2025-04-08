struct A {
    x: Int;
}

struct B {
    y: String;
}

struct C {
    z: Bool;
}

contract HeteroFields {
    fa: A;
    fb: B;
    fc: C;
    flag: Bool;
    num: Int;
    word: String;
    init() {
        self.fa = A{x:5};
        self.fb = B{y:"hi"};
        self.fc = C{z:true};
        self.flag = false;
        self.num = 9;
        self.word = "yo";
    }
}