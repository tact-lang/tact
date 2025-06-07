struct Val {
    x: Int;
}

contract TestContract {
    n1: Val = Val{x:1};
    n2: Val = Val{x:2};
    n3: Val = Val{x:3};
    n4: Val = Val{x:4};
    n5: Val = Val{x:5};
    n6: Val = Val{x:6};
    n7: Val = Val{x:7};
    n8: Val = Val{x:8};
    n9: Val = Val{x:9};
    n10: Val = Val{x:10};
    
    init(){
        self.n1 = Val{x:11};
        self.n2 = Val{x:12};
        self.n3 = Val{x:13};
        self.n4 = Val{x:14};
        self.n5 = Val{x:15};
        self.n6 = Val{x:16};
        self.n7 = Val{x:17};
        self.n8 = Val{x:18};
        self.n9 = Val{x:19};
        self.n10 = Val{x:20};
    }
    receive(){}
}