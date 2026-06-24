struct MultipleBool {
    b1: Bool;
    b2: Bool;
    b3: Bool;
    b4: Bool?;
    b5: Bool?;
}

contract TestMultiBool {
    m: MultipleBool;

    init() {
        self.m = MultipleBool{
            b1:true,b2:false,b3:true,b4:null,b5:false
        };
    }
}