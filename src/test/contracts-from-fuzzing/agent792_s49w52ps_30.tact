struct DeepEmbed2 {
    f1: Int;
    f2: String;
    f3: Bool;
    f4: String?;
}

struct DeepEmbed1 {
    sub1: DeepEmbed2;
    sub2: DeepEmbed2;
}

contract DeepEmbedContract {
    val: DeepEmbed1;

    init() {
        self.val = DeepEmbed1{
            sub1: DeepEmbed2{f1:1,f2:"a",f3:true,f4:null},
            sub2: DeepEmbed2{f1:2,f2:"b",f3:false,f4:null}
        };
    }
}