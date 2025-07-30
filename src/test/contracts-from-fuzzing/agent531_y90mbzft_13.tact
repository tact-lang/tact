struct LargeStruct {
    a: Int; b: Int; c: Int; d: Int; e: Int; 
    f: Int; g: Int; h: Int; i: Int; j: Int; 
    k: Int; l: Int; m: Int; n: Int; o: Int;
}

contract BulkStorage {
    s1: LargeStruct;
    s2: LargeStruct;

    init() {
        self.s1 = LargeStruct{
            a:1,b:2,c:3,d:4,e:5,f:6,g:7,h:8,i:9,j:10,k:11,l:12,m:13,n:14,o:15
        };
        self.s2 = LargeStruct{
            a:10,b:20,c:30,d:40,e:50,f:60,g:70,h:80,i:90,j:100,k:110,l:120,m:130,n:140,o:150
        };
    }
}