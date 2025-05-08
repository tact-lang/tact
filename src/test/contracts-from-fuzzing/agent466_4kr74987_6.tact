struct Inner1 {
    x: Int;
}

struct Inner2 {
    y: Bool;
}

struct Compose {
    first: Inner1;
    second: Inner2;
}

contract MultipleStructs {
    data: Compose;

    init() {
        self.data = Compose{
            first: Inner1{x:42},
            second: Inner2{y:true}
        };
    }
}