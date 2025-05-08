struct Sub {
    X: Int;
}

struct Container {
    OptSub: Sub?;
    SubMap: map<Int, Sub>;
    Nested: Sub;
}

contract TestContainer {
    receive() {
         let m: map<Int, Sub> = emptyMap();
         m.set(42, Sub { X: 1000 });
         let cont = Container {
               OptSub: Sub { X: 2000 },
               SubMap: m,
               Nested: Sub { X: 3000 }
         };
         let opt_val: Int = cont.OptSub != null ? cont.OptSub!!.X : 0;
         let map_val: Int = cont.SubMap.get(42) != null ? cont.SubMap.get(42)!!.X : 0;
         let res = opt_val + map_val + cont.Nested.X;
         res;
    }
}
