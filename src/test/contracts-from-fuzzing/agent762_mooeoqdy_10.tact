struct LargePersistent {
    i1: Int; b1: Bool; s1: String; cl1: Cell; sl1: Slice; a1: Address;
    i2: Int; b2: Bool; s2: String; cl2: Cell; sl2: Slice; a2: Address;
    i3: Int; b3: Bool; s3: String; cl3: Cell; sl3: Slice; a3: Address;
}

contract TestContract {
    storage: LargePersistent;

    init() {
        self.storage = LargePersistent{
            i1:1,b1:true,s1:"a",cl1:emptyCell(),sl1:emptyCell().asSlice(),a1:myAddress(),
            i2:2,b2:false,s2:"b",cl2:emptyCell(),sl2:emptyCell().asSlice(),a2:myAddress(),
            i3:3,b3:true,s3:"c",cl3:emptyCell(),sl3:emptyCell().asSlice(),a3:myAddress()
        };
    }

    receive() {
        self.storage = self.storage;
    }
}