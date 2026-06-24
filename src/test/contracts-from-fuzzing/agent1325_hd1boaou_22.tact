struct Leaf {
    x: Int?;
    y: Bool?;
}

struct Node1 {
    a: Int; b: Bool; c: Int?; d: Bool?;
    e: Leaf; f: Leaf; g: Leaf; h: Leaf;
}

struct Node2 {
    a: Node1; b: Node1; c: Node1; d: Node1;
}

struct Node3 {
    a: Node2; b: Node2;
}

contract TestContract {
    huge: Node3;

    init() {
        self.huge = Node3{
            a: Node2{
                a: Node1{
                    a:1,b:true,c:null,d:true,
                    e: Leaf{x:1,y:true}, f: Leaf{x:null,y:null},
                    g: Leaf{x:2,y:false}, h: Leaf{x:null,y:true}
                },
                b: Node1{
                    a:1,b:true,c:null,d:true,
                    e: Leaf{x:1,y:true}, f: Leaf{x:null,y:null},
                    g: Leaf{x:2,y:false}, h: Leaf{x:null,y:true}
                },
                c: Node1{
                    a:1,b:true,c:null,d:true,
                    e: Leaf{x:1,y:true}, f: Leaf{x:null,y:null},
                    g: Leaf{x:2,y:false}, h: Leaf{x:null,y:true}
                },
                d: Node1{
                    a:1,b:true,c:null,d:true,
                    e: Leaf{x:1,y:true}, f: Leaf{x:null,y:null},
                    g: Leaf{x:2,y:false}, h: Leaf{x:null,y:true}
                }
            },
            b: Node2{
                a: Node1{
                    a:1,b:true,c:null,d:true,
                    e: Leaf{x:1,y:true}, f: Leaf{x:null,y:null},
                    g: Leaf{x:2,y:false}, h: Leaf{x:null,y:true}
                },
                b: Node1{
                    a:1,b:true,c:null,d:true,
                    e: Leaf{x:1,y:true}, f: Leaf{x:null,y:null},
                    g: Leaf{x:2,y:false}, h: Leaf{x:null,y:true}
                },
                c: Node1{
                    a:1,b:true,c:null,d:true,
                    e: Leaf{x:1,y:true}, f: Leaf{x:null,y:null},
                    g: Leaf{x:2,y:false}, h: Leaf{x:null,y:true}
                },
                d: Node1{
                    a:1,b:true,c:null,d:true,
                    e: Leaf{x:1,y:true}, f: Leaf{x:null,y:null},
                    g: Leaf{x:2,y:false}, h: Leaf{x:null,y:true}
                }
            }
        };
    }

    receive() {
        self.huge = self.huge;
    }
}