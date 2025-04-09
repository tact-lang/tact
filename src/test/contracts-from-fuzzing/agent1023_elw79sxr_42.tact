struct Optionals {
    a:Int?; b:Bool?; c:String?; d:Address?; e:Cell?; f:Slice?;
}

contract DefaultsAndNulls {
    val: Optionals;

    init() {
        self.val = Optionals{
            a:null,b:null,c:null,d:null,e:null,f:null
        };
    }
}