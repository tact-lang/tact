struct MapContainer {
    m: map<Int, Int>;
}

struct Wrapper {
    container: MapContainer;
}

contract TestContract {
    val: Wrapper = Wrapper{
        container: MapContainer{
            m: emptyMap()
        }
    };
    receive() {
        let _ = self.val;
    }
}