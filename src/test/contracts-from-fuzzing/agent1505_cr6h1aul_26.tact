struct SeveralOptional {
    a:Int?; b:Bool?; c:String?;
}

contract ManyNulls {
    val: SeveralOptional?;
    init() {
        self.val = null;
    }
}