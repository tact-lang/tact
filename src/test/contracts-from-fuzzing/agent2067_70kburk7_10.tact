struct Inner1 {
    b1: Bool;
    b2: Bool;
    b3: Bool;
    b4: Bool;
}

struct Inner2 {
    addr: Address;
    s: String;
}

struct AllPrimitives {
    i: Int;
    b: Bool;
    c: Cell;
    s: Slice;
    str: String;
    inn1: Inner1;
    inn2: Inner2;
}

contract AllTypes {
    data: AllPrimitives;

    init() {
        self.data = AllPrimitives{
            i: 777,
            b: true,
            c: emptyCell(),
            s: emptyCell().asSlice(),
            str: "hello",
            inn1: Inner1{b1:true, b2:false, b3:true, b4:false},
            inn2: Inner2{addr: myAddress(), s: "world"}
        };
    }
}