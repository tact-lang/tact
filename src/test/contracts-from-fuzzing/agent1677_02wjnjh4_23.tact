struct OnlyOptions {
    o1:Int?;
    o2:Bool?;
    o3:String?;
}

contract TestOnlyOpt {
    val: OnlyOptions = OnlyOptions{o1:null, o2:null, o3:null};

    init() {
        self.val=OnlyOptions{o1:42,o2:true,o3:"str"};
    }
}
