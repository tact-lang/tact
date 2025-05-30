contract MapOrderTest {
    receive() {
        // Create a map of Int to Int, with two entries added in non-sorted order
        let m: map<Int, Int> = emptyMap();
        m.set(100, 1);
        m.set(23, 2);
        
        // The documentation states that iterating a map traverses keys from smaller to larger.
        // We capture the first key encountered during iteration.
        let firstKey: Int? = null;
        foreach (k, v in m) {
            if (firstKey == null) {
                firstKey = k;
            }
        }
        
        // Use non-null assertion on firstKey and reply its string representation
        reply(firstKey!!.toString());
    }
}

inline fun reply(str: String) {
    message(MessageParameters {
        to: sender(),
        value: 0,
        mode: SendRemainingValue | SendIgnoreErrors,
        body: str.asComment(),
    });
}
