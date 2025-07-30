struct Mix {
    i: Int;
    o: Int?;
    b: Bool;
    ob: Bool?;
    a: Address;
    oa: Address?;
    c: Cell;
    oc: Cell?;
    s: String;
    os: String?;
}

contract TestContract {
    val: Mix;

    init() {
        self.val = Mix{
            i:1, o:null, b:true, ob:null, a:myAddress(), oa:null,
            c:emptyCell(), oc:null, s:"hi", os:null
        };
    }
}