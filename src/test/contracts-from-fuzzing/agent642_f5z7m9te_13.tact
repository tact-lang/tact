struct Large {
    a1: Int; a2: Int; a3: Int; a4: Int; a5: Int;
    b1: Bool; b2: Bool; b3: Bool; b4: Bool; b5: Bool;
    c1: String; c2: String; c3: String; c4: String; c5: String;
    d1: Int?; d2: Int?; d3: Int?; d4: Int?; d5: Int?;
}

contract TestContract {
    data: Large;

    init() {
        self.data = Large{
            a1:1,a2:2,a3:3,a4:4,a5:5,
            b1:true,b2:false,b3:true,b4:false,b5:true,
            c1:"one",c2:"two",c3:"three",c4:"four",c5:"five",
            d1:null,d2:null,d3:null,d4:null,d5:null
        };
    }
}