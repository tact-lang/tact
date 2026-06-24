struct BigCombo {
    a:Int; b:Bool; c:String; d:Address;
    e:Int?; f:Bool?; g:String?; h:Address?;
}

contract BigComboTest {
    s: BigCombo;
    init() {
        self.s = BigCombo{
            a:1,b:true,c:"c",d:myAddress(),
            e:null,f:null,g:null,h:null
        };
    }

    receive() {
        self.s = self.s;
    }
}