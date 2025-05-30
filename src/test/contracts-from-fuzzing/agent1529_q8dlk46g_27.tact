struct Inner { s:String; }

contract NestedOptStr {
    data: Inner?;

    init() {
        self.data = null;
    }
}
