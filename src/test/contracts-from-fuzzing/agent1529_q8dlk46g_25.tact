struct Sub { s:String; }

contract OptNestedStruct {
    field: Sub?;

    init() {
        self.field = null;
    }
}
