// Test very large struct AND deep nesting
struct Inner20 {
    a:Int;b:Int;c:Int;d:Int;e:Int;f:Int;g:Int;h:Int;i:Int;j:Int;
    k:Int;l:Int;m:Int;n:Int;o:Int;p:Int;q:Int;r:Int;s:Int;t:Int;
}

struct Middle20 {
    x:Inner20;
    y:Inner20;
}

struct Outer20 {
    p:Middle20;
    q:Middle20;
}

contract HugeNestedStruct {
    all:Outer20;
    init() {
        self.all = Outer20{
            p: Middle20{ x:Inner20{
                a:1,b:1,c:1,d:1,e:1,f:1,g:1,h:1,i:1,j:1,
                k:1,l:1,m:1,n:1,o:1,p:1,q:1,r:1,s:1,t:1 },
                y:Inner20{
                a:2,b:2,c:2,d:2,e:2,f:2,g:2,h:2,i:2,j:2,
                k:2,l:2,m:2,n:2,o:2,p:2,q:2,r:2,s:2,t:2 }
            }, q: Middle20{
                x:Inner20{
                a:3,b:3,c:3,d:3,e:3,f:3,g:3,h:3,i:3,j:3,
                k:3,l:3,m:3,n:3,o:3,p:3,q:3,r:3,s:3,t:3 },
                y:Inner20{
                a:4,b:4,c:4,d:4,e:4,f:4,g:4,h:4,i:4,j:4,
                k:4,l:4,m:4,n:4,o:4,p:4,q:4,r:4,s:4,t:4 }
            }
        };
    }
}