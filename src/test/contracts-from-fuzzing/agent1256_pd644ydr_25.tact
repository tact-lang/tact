struct Flat {
    a:Int; b:Int; c:Int; d:Int; e:Int; f:Int; g:Int; h:Int;
    s1:String; s2:String; s3:String; s4:String;
    b1:Bool; b2:Bool; b3:Bool;
    opt1:Int?; opt2:Bool?; opt3:String?;
}

contract FlatHolder {
    val: Flat;

    init() {
        self.val = Flat{
            a:1,b:2,c:3,d:4,e:5,f:6,g:7,h:8,
            s1:"s1",s2:"s2",s3:"s3",s4:"s4",
            b1:true,b2:false,b3:true,
            opt1:null,opt2:null,opt3:null
        };
    }
}
