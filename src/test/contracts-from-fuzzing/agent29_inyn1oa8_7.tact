struct Inner { value: Int; }

struct Container {
    maybe: Inner?;
    data: map<Int, Int>;
}

contract TestOptionalMap {
    receive() {
       let c: Container = Container {
            maybe: Inner { value: 123 },
            data: emptyMap()
       };
       
       if (c.maybe != null) {
           // Use !! operator to unwrap the optional
           let v = c.maybe!! .value;
           dump(v);
       } else {
           dump(0);
       }
       
       c.data.set(10, 20);
       let pv = c.data.get(10);
       dump(pv);
    }
}
