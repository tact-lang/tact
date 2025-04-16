struct Inner { x: Int }

struct WithMap { m: map<Int, Inner> }

contract MapStructTest {
    receive() {
        let inner = Inner { x: 100 };
        let myMap: map<Int, Inner> = emptyMap();
        myMap.set(1, inner);
        let ws = WithMap { m: myMap };
        dump(ws.m.get(1)!!.x);
    }
}
