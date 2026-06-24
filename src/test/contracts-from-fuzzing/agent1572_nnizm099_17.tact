// Large contract with deeply nested struct in a chain, pushing nesting limits
struct N4 { data: Int; flag: Bool } 

struct N3 { child: N4; info: String; flag: Bool }

struct N2 { child: N3; val: Int?; }

struct N1 { child: N2; text: String?; }

contract DeepMany {
    root: N1 = N1{
        child: N2{child: N3{child:N4{data:0,flag:false}, info:"", flag:false}, val:null},
        text: null
    };

    init() {
        self.root = N1{
            child: N2{
                child: N3{
                    child: N4{data:42, flag:true},
                    info: "ok",
                    flag: true
                },
                val: 77
            },
            text: "hello"
        };
    }
}
