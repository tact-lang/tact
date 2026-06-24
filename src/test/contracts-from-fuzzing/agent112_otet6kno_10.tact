struct BigNestedInner {
    a: Int;
    b: Bool;
    c: String;
    d: Int;
    e: Bool;
    f: String;
}

struct BigNested {
    inner1: BigNestedInner;
    inner2: BigNestedInner;
    inner3: BigNestedInner;
}

contract HugeStruct {
    storage: BigNested = BigNested{
        inner1: BigNestedInner{
            a:1, b:true, c:"x", d:2, e:false, f:"y"
        },
        inner2: BigNestedInner{
            a:3, b:false, c:"a", d:4, e:true, f:"b"
        },
        inner3: BigNestedInner{
            a:5, b:true, c:"c", d:6, e:false, f:"d"
        }
    };

    init() {
        self.storage = BigNested{
            inner1: BigNestedInner{
                a:11, b:false, c:"aa", d:22, e:true, f:"bb"
            },
            inner2: BigNestedInner{
                a:33, b:true, c:"cc", d:44, e:false, f:"dd"
            },
            inner3: BigNestedInner{
                a:55, b:false, c:"ee", d:66, e:true, f:"ff"
            }
        };
    }
}
