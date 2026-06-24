struct Inner { x: Int; y: Int; }

struct Mid { 
    inner: Inner?; 
    m: map<Int, Int>;
}

fun testMid(mid: Mid): Int {
    let innerSum = mid.inner != null ? mid.inner!!.x + mid.inner!!.y : 0;
    let mVal = mid.m.get(1) != null ? mid.m.get(1)!! : 0;
    return innerSum + mVal;
}

contract TestNestedOptionalMap {
    receive() {
        let myMap: map<Int, Int> = emptyMap();
        myMap.set(1, 5);

        let mid1: Mid = Mid {
            inner: Inner { x: 10, y: 20 },
            m: myMap
        };
        let mid2: Mid = Mid {
            inner: null,
            m: myMap
        };

        let res1 = testMid(mid1);
        let res2 = testMid(mid2);
        res1 + res2;
    }
}
