struct S {
    arr1: Bool; arr2: Bool; arr3: Bool; arr4: Bool; arr5: Bool;
    arr6: Bool; arr7: Bool; arr8: Bool; arr9: Bool; arr10: Bool;
    arr11: Bool; arr12: Bool; arr13: Bool; arr14: Bool; arr15: Bool;
    arr16: Bool; arr17: Bool; arr18: Bool; arr19: Bool; arr20: Bool;
}

contract TestContract {
    s: S;

    init() {
        self.s = S{
            arr1:true,arr2:false,arr3:true,arr4:false,arr5:true,
            arr6:false,arr7:true,arr8:false,arr9:true,arr10:false,
            arr11:true,arr12:false,arr13:true,arr14:false,arr15:true,
            arr16:false,arr17:true,arr18:false,arr19:true,arr20:false
        };
    }
}
