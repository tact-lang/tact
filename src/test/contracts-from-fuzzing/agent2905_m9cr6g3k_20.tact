struct X { a: Int; b: Bool; c: Address; d: Cell; e: Slice; f: String; }

contract ManyOfStructX {
    s1: X;
    s2: X;
    s3: X;

    init() {
        self.s1 = X{ a:1, b:true, c:myAddress(), d:emptyCell(), e:emptyCell().asSlice(), f:"A" };
        self.s2 = X{ a:2, b:false, c:myAddress(), d:emptyCell(), e:emptyCell().asSlice(), f:"B" };
        self.s3 = X{ a:3, b:true, c:myAddress(), d:emptyCell(), e:emptyCell().asSlice(), f:"C" };
    }
}