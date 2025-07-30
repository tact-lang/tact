struct A { a: Int; b: Bool; c: String; d: Address; e: Cell; f: Slice; g: Int?; }
struct B { a: A; b: A; }
contract DoubleNested {
    data: B;

    init() {
        self.data = B{
            a: A{a:1,b:true,c:"x",d:myAddress(),e:emptyCell(),f:emptyCell().asSlice(),g:null},
            b: A{a:2,b:false,c:"y",d:myAddress(),e:emptyCell(),f:emptyCell().asSlice(),g:null}
        };
    }
}
