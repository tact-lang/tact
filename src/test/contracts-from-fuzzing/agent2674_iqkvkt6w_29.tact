struct Alternate { b: Bool; i: Int; s: String }

contract AlternatingTypes {
    one: Alternate;
    two: Alternate;

    init() {
        self.one = Alternate{ b:true, i:1, s:"a" };
        self.two = Alternate{ b:false, i:2, s:"b" };
    }
}