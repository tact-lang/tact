contract Test {
    t: Int = 0;

    receive() {}

    get fun and(): Bool {
        let x = false;
        x = x && (1 / self.t == 0);
        return x;
    }

    get fun or(): Bool {
        let x = true;
        x = x || (1 / self.t == 0);
        return x;
    }

    get fun andAssign(): Bool {
        let x = false;
        x &&= (1 / self.t == 0);
        return x;
    }

    get fun orAssign(): Bool {
        let x = true;
        x ||= (1 / self.t == 0);
        return x;
    }
}
