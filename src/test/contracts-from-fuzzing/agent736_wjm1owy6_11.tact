struct Outer {
    inn: Inner;
    optional: Int?;
}

struct Inner {
    deep: Deep;
}

struct Deep {
    flag: Bool;
    name: String;
}

contract TestContract {
    o: Outer = Outer{inn: Inner{deep: Deep{flag:true, name: "deep"}}, optional: null};

    init() {
        self.o = Outer{inn: Inner{deep: Deep{flag:true, name: "deep"}}, optional: null};
    }

    receive() {
        dump(self.o.inn.deep.name);
    }
}