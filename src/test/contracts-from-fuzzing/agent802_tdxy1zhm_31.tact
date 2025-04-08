struct MultipleOptionals { a:Int?; b:Int?; c:Int?; d:String?; e:Bool?; }

contract OptionalsBig {
    o: MultipleOptionals;
    init() {
        self.o = MultipleOptionals{
            a:null, b:null, c:null, d:null, e:null
        };
    }
}