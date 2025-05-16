struct Deep {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
}

struct Node {
    p: Deep;
    q: Deep;
    r: Deep;
    s: Deep;
    t: Deep;
}

contract WideStruct {
    node: Node;
    
    init() {
        self.node = Node{
            p: Deep{a:1,b:2,c:3,d:4,e:5},
            q: Deep{a:6,b:7,c:8,d:9,e:10},
            r: Deep{a:11,b:12,c:13,d:14,e:15},
            s: Deep{a:16,b:17,c:18,d:19,e:20},
            t: Deep{a:21,b:22,c:23,d:24,e:25}
        };
    }
}