struct BoolFields {
    f1: Bool;
    f2: Bool;
    f3: Bool;
    f4: Bool;
    f5: Bool;
}

contract TestContract {
    data: BoolFields;

    init() {
        self.data = BoolFields{ f1:true, f2:false, f3:true, f4:false, f5:true };
    }
}