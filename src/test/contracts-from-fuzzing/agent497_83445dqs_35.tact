struct Arr1 { a: Int; b: Int; c: Int; d: Int; e: Int; }
struct Arr2 { f: Int; g: Int; h: Int; i: Int; j: Int; }
struct Arr3 { k: Int; l: Int; m: Int; n: Int; o: Int; }
struct Arr4 { p: Int; q: Int; r: Int; s: Int; t: Int; }

contract ManyStructs {
    s1: Arr1;
    s2: Arr2;
    s3: Arr3;
    s4: Arr4;

    init() {
        self.s1=Arr1{a:1,b:2,c:3,d:4,e:5};
        self.s2=Arr2{f:6,g:7,h:8,i:9,j:10};
        self.s3=Arr3{k:11,l:12,m:13,n:14,o:15};
        self.s4=Arr4{p:16,q:17,r:18,s:19,t:20};
    }
}