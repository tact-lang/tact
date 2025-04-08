struct SubData { a:Int; b:Bool; c:String }

contract ManyOptionalNested {
    optA: SubData?;
    optB: SubData?;
    optC: SubData?;

    init() {
        self.optA = null;
        self.optB = null;
        self.optC = SubData{a: 3, b: true, c: "hello"};
    }
}