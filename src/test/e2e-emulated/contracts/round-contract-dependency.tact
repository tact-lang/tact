contract A {
    number: Int as uint32 = 0; // Different numbers to get different StateInit

    receive() {

    }

    get fun getNext(): StateInit {
        return initOf B();
    }

    get fun getNestedNext(): StateInit {
        return initOf C();
    }
}

contract B {
    number: Int as uint32 = 1; // Different numbers to get different StateInit

    receive() {

    }

    get fun getNext(): StateInit {
        return initOf C();
    }

    get fun getNestedNext(): StateInit {
        return initOf A();
    }
}

contract C {
    number: Int as uint32 = 2; // Different numbers to get different StateInit

    receive() {

    }

    get fun getNext(): StateInit {
        return initOf A();
    }

    get fun getNestedNext(): StateInit {
        return initOf B();
    }
}
