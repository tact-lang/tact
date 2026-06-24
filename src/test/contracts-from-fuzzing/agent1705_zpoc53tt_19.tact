struct Inner { foo:Int; bar:Bool }

contract OptionalStruct {
    val: Inner?;

    init() {
        self.val = null;
    }
}