import { Component } from '@angular/core';
import { awesomepackage } from '../models/compiled';
import { breakermodule } from 'src/models/openfmb-model';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  title = 'my-protobuf-app';

  /**
   *
   */
  constructor() {
    let message = awesomepackage.AwesomeMessage.create({ awesomeField: 'hello' });
    let buffer = awesomepackage.AwesomeMessage.encode(message).finish();
    let decoded = awesomepackage.AwesomeMessage.decode(buffer);
    debugger;

    let mrssageTwo = breakermodule.BreakerDiscreteControlProfile.create({});
    let bufferTwo = breakermodule.BreakerDiscreteControlProfile.encode(mrssageTwo).finish();
    var decodedTwo = breakermodule.BreakerDiscreteControlProfile.decode(bufferTwo);
  }
}
