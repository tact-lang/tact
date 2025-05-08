contract TestNestedMap {
    // Persistent map: key type Address, value type MyData
    m: map<Address, MyData> = emptyMap();

    receive() {
        let data: MyData = MyData { innerMap: emptyMap() };
        // Set a value inside the inner map
        data.innerMap.set(1, 1);
        let sender: Address = context().sender;
        self.m.set(sender, data);

        let dataOpt: MyData? = self.m.get(sender);
        if (dataOpt != null) {
            let value: Int? = dataOpt!!.innerMap.get(1);
            if (value != null) {
                dump(value!!); // expected: 1
            } else {
                dump(0);
            }
        } else {
            dump(0);
        }
    }
}

struct MyData {
    innerMap: map<Int, Int>
}
