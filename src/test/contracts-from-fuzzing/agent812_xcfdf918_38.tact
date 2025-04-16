struct MultiLayer1 { a:Int?; nested: MultiLayer2 }
struct MultiLayer2 { b:String?; nested: MultiLayer3 }
struct MultiLayer3 { c:Bool?; }

contract OptionalMultipleLayers {
    val: MultiLayer1;

    init() {
        self.val = MultiLayer1{ a:null, nested: MultiLayer2{b:null,nested:MultiLayer3{c:null}} };
    }
}