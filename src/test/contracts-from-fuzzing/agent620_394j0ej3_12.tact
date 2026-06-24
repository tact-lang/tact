struct Deep {
    x: Int as int16;
    y: Int as uint8;
}

struct Container {
    payload: Deep?;
}

contract TestContract {
    st: Container;

    init() {
        self.st = Container{
            payload: null
        };
    }

    receive() {
        if (self.st.payload != null) {
            let _ = self.st.payload!!.x;
            let _ = self.st.payload!!.y;
        }
    }
}