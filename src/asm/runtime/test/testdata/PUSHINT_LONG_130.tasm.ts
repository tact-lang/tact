import * as i from "../../index"

export const instructions = [
    i.ACCEPT(),
    i.DROP(),
    i.LDREF(),
    i.DROP(),
    i.PUSHINT_LONG(130n),
    i.SENDRAWMSG(),
]
