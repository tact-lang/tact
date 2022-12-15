import { CID } from 'multiformats/cid';
import * as json from 'multiformats/codecs/json';
import { sha256 } from 'multiformats/hashes/sha2';

export async function calculateIPFSlink(data: Buffer) {
    const hash = await sha256.digest(data)
    const cid = CID.create(1, json.code, hash)
    return 'ipfs://' + cid.toString();
}
