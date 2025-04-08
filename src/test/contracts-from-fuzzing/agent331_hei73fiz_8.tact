struct NestedObj {
    flag: Bool;
    text: String;
}

contract PersistArraylike {
    item1: NestedObj;
    item2: NestedObj;
    item3: NestedObj;

    init() {
        self.item1 = NestedObj{flag:true, text:"one"};
        self.item2 = NestedObj{flag:false, text:"two"};
        self.item3 = NestedObj{flag:true, text:"three"};
    }
}